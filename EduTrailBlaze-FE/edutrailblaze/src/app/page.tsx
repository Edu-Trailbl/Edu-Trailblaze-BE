import WebFooter from "@/components/footer";
import WebHeader from "@/components/header";
import HomeCourses from "@/components/home_courses";
import HomeTeacherArea from "@/components/home_teacher_area";
import ImageSlider from "@/components/image_slider";
import MakeDiffer from "@/components/make_different";
import Image from "next/image";

export default function Home() {
  return (
    <div>
      <WebHeader></WebHeader>
      <ImageSlider></ImageSlider>
      <HomeCourses></HomeCourses>
      <MakeDiffer></MakeDiffer>
      <HomeTeacherArea></HomeTeacherArea>
      <WebFooter></WebFooter>
    </div>
  );
}
