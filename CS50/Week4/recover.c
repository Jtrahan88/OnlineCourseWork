#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t BYTE;


int main(int argc, char *argv[])
{

    // check to be sure we have at least one command line arguement
    if (argc != 2)
    {
        printf("we need one comand line arguement\n");
        return 1;
    }

    // open the file
    FILE *input_file = fopen(argv[1], "r");

    //  check if file is valid
    if (input_file == NULL)
    {
        printf("File is invaild\n");
        return 2;
    }

    //  store blocks of 512 bytes
    //  use unsigned char beacsue we do not have to account for negitive numbers
    unsigned char buffer[512];

    // count teh number of images in file(s)
    int count_image = 0;

    //  file pointer for recovered images
    FILE *output_file = NULL;

    // allocate memory for the file name
    char *filename = malloc(8 * sizeof(char));

    // Read through the 512 bytes of blocks
    while (fread(buffer, sizeof(char), 512, input_file))
        //  buffer = pointer to the array where the read objects are stored
        //  sizeof(char) = Size of each object in bytes
        //  512 = Number of objects to read
        //  file = Source

    {
        // Check if bytes indicate the start of the JPEG
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            // Need to close the old output file for each image before writing a new image file to prvent memory loss
            if (count_image > 0)
            {
                fclose(output_file);
            }

            // Write the JPEG files names
            sprintf(filename, "%03i.jpg", count_image);

            // Open output_file to write
            output_file = fopen(filename, "w");

            // Count numbre of images found in the file
            count_image++;
        }

        // Check if output has been used for valid input
        if (output_file != NULL)
        {
            fwrite(buffer, sizeof(char), 512, output_file);
            // buffer = Array o f elements to be printed
            //  sizeof(char) = Size of bytes for us to write
            //  512 = Number of elements to write
            // output_file = Pointer to the file that we are writing

        }
    }
    // free() = allows you to release or deallocate the memory blocks which are previously allocated by calloc(), malloc() or realloc() functions
    free(filename);
    // close out files to prevent memory leak
    fclose(output_file);
    fclose(input_file);

    return 0;




}
