#pragma once

namespace Belayat
{
    namespace image
    {
        namespace algorithm
        {
            template<class IMAGE>
            void contour3(const IMAGE &src, IMAGE &dst)
            {
                //    std::vector< std::vector< cv::Point3i > > contours;
                //    cv::findContours(t2.img, contours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
                //
                //    for (auto contour = contours.begin(); contour != contours.end(); contour++){
                //        std::cout << contour[0] << std::endl;
                ////        cv::polylines(tmp.img, *contour, false, cv::Scalar(255), 1);
                //    }

                IMAGE tmp = src;
                const auto EXT = src.get_extent();

                for (int k = 1; k < EXT[2]-1; k++) {
                    for (int j = 1; j < EXT[1]-1; j++) {
                        for (int i = 1; i < EXT[0]-1; i++) {
                            if (src.get_data(i, j, k) <= 0)
                                tmp.get_data(i, j, k) = 0;

                            int sum = 0;

                            if (src.get_data(i-1, j, k) > 0) sum++;
                            if (src.get_data(i+1, j, k) > 0) sum++;
                            if (src.get_data(i, j-1, k) > 0) sum++;
                            if (src.get_data(i, j+1, k) > 0) sum++;
                            if (src.get_data(i, j, k-1) > 0) sum++;
                            if (src.get_data(i, j, k+1) > 0) sum++;

                            if (sum != 6) {
                                tmp.get_data(i, j, k) = src.get_data(i, j, k);
                            } else {
                                tmp.get_data(i, j, k) = 0;
                            }
                        }
                    }
                }

                dst = tmp;
            }


            template<class IMAGE>
            void contour2(const IMAGE &src, IMAGE &dst)
            {
                IMAGE tmp = src;

                const auto EXT = src.get_extent();

                for (int j = 1; j < EXT[1]-1; j++) {
                    for (int i = 1; i < EXT[0]-1; i++) {
                        if (src.get_data(i, j, 0) <= 0)
                            tmp.get_data(i, j, 0) = 0;

                        int sum = 0;

                        if (src.get_data(i-1, j, 0) > 0) sum++;
                        if (src.get_data(i+1, j, 0) > 0) sum++;
                        if (src.get_data(i, j-1, 0) > 0) sum++;
                        if (src.get_data(i, j+1, 0) > 0) sum++;

                        if (sum != 4) {
                            tmp.get_data(i, j, 0) = src.get_data(i, j, 0);
                        } else {
                            tmp.get_data(i, j, 0) = 0;
                        }
                    }
                }

                dst = tmp;
            }
        }
    }
}