<template>
  <v-app>
    <v-row>
      <jupyter-widget :widget="scatter"/>
    </v-row>
    <v-row>
      <jupyter-widget :widget="histogram"/>
    </v-row>
  </v-app>
</template>
