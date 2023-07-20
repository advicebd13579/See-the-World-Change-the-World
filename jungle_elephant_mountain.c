#include <stdio.h>
#include <stdlib.h>

// Global variables
int world_width;
int world_height;

// Representation of the world
struct World {
    int width;
    int height;
    char **map; // 2D array of characters 
};

// Initialize the world with given size
void init_world(struct World *world, int width, int height) {
    world->width = width;
    world->height = height;

    // Allocate memory for 2D array
    world->map = malloc(sizeof(char*) * world->width);

    // Fill each row with blanks
    int i;
    for (i = 0; i < world->width; i++) {
        world->map[i] = malloc(sizeof(char) * world->height);
        int j;
        for (j = 0; j < world->height; j++) {
            world->map[i][j] = ' ';
        }
    }
}

// Free the world from memory
void free_world(struct World *world) {
    int i;
    for (i = 0; i < world->width; i++) {
        free(world->map[i]);
    }
    free(world->map);
}

// Print the world to the console
void print_world(struct World *world) {
    int i;
    for (i = 0; i < world->width; i++) {
        int j;
        for (j = 0; j < world->height; j++) {
            printf("%c", world->map[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

// Add a row to the top of the world
void add_row_top(struct World *world) {
    int i;
    // Allocate a new row at the top
    char *new_row = malloc(sizeof(char) * world->height);
    for (i = 0; i < world->height; i++) {
        new_row[i] = ' ';
    }

    // Allocate memory for a new map
    char **new_map = malloc(sizeof(char*) * (world->width + 1));

    // Copy each row from the old map into the new map,
    // starting from the new row at the top
    for (i = 0; i < world->width; i++) {
        new_map[i + 1] = world->map[i];
    }

    // Put the new row at the top
    new_map[0] = new_row;

    // Free the old map
    free(world->map);

    // Update the world with the new map
    world->width++;
    world->map = new_map;
}

// Add a row to the bottom of the world
void add_row_bottom(struct World *world) {
    int i;
    // Allocate a new row at the bottom
    char *new_row = malloc(sizeof(char) * world->height);
    for (i = 0; i < world->height; i++) {
        new_row[i] = ' ';
    }

    // Allocate memory for a new map
    char **new_map = malloc(sizeof(char*) * (world->width + 1));

    // Copy each row from the old map into the new map,
    // starting from the old row at the bottom
    for (i = 0; i < world->width; i++) {
        new_map[i] = world->map[i];
    }

    // Put the new row at the bottom
    new_map[world->width] = new_row;

    // Free the old map
    free(world->map);

    // Update the world with the new map
    world->width++;
    world->map = new_map;
}

// Add a column to the right side of the world
void add_column_right(struct World *world) {
    int i;

    // Allocate memory for a new map
    char **new_map = malloc(sizeof(char*) * world->width);

    // Copy each row from the old map into the new map,
    // adding a blank column to the right
    for (i = 0; i < world->width; i++) {
        new_map[i] = malloc(sizeof(char) * (world->height + 1));
        
        int j;
        for (j = 0; j < world->height; j++) {
            new_map[i][j] = world->map[i][j];
        }
        new_map[i][world->height] = ' ';

        // Free the old row
        free(world->map[i]);
    }

    // Free the old map
    free(world->map);

    // Update the world with the new map
    world->height++;
    world->map = new_map;
}

// Add a column to the left side of the world
void add_column_left(struct World *world) {
    int i;

    // Allocate memory for a new map
    char **new_map = malloc(sizeof(char*) * world->width);

    // Copy each row from the old map into the new map,
    // adding a blank column to the left
    for (i = 0; i < world->width; i++) {
        new_map[i] = malloc(sizeof(char) * (world->height + 1));
        
        int j;
        // Put a blank in the first position of the row
        new_map[i][0] = ' ';
        for (j = 0; j < world->height; j++) {
            new_map[i][j + 1] = world->map[i][j];
        }

        // Free the old row
        free(world->map[i]);
    }

    // Free the old map
    free(world->map);

    // Update the world with the new map
    world->height++;
    world->map = new_map;
}

// Add a character to the world
void add_character(struct World *world, char c, int x, int y) {
    // Check if the position is in bounds
    if (x < 0 || x >= world->width || y < 0 || y >= world->height) {
        printf("Position (%d, %d) is out of bounds\n", x, y);
        return;
    }

    world->map[x][y] = c;
}

int main() {
    // Create the world
    struct World world;
    init_world(&world, world_width, world_height);

    // Add rows and columns
    add_row_top(&world);
    add_row_bottom(&world);
    add_column_left(&world);
    add_column_right(&world);

    // Add some characters
    add_character(&world, '#', 0, 0);
    add_character(&world, '#', 0, world.height - 1);
    add_character(&world, '#', world.width - 1, 0);
    add_character(&world, '#', world.width - 1, world.height - 1);

    // Print the world
    print_world(&world);

    // Free the world from memory
    free_world(&world);

    return 0;
}