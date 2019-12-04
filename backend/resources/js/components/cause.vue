<template>
  <div class="wrapper">
    <p>Ihåliga nuggets</p>
    <p>{{ data.cause }}</p>
  </div>
</template>

<script>
export default {
  props: ["data", "cause"],
  data() {
    return {
      data: null
    };
  },
  methods: {
    getData() {
      axios.get("/api/feedback/get").then(res => {
        console.log(res);
        this.data = res.data;
      });
    }
  }
};
</script>

<style>
</style>