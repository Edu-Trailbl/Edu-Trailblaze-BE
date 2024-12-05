import WebFooter from "@/components/footer";
import WebHeader from "@/components/header";
import HomeCourses from "@/components/home_courses";
import ImageSlider from "@/components/image_slider";
import Image from "next/image";

export default function Home() {
  return (
    <div>
      <WebHeader></WebHeader>
      <ImageSlider></ImageSlider>
      <HomeCourses></HomeCourses>
      <WebFooter></WebFooter>
    </div>
  );
}
