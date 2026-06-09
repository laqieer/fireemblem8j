	.syntax unified
	.section .text.GetGenericChibiImg, "ax", %progbits
@ GetGenericChibiImg @ JP 0x08005E70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetGenericChibiImg
	.thumb_func
GetGenericChibiImg:
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08005E98 @ =0x080DC3FC
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	ldr r5, _08005E9C @ =0xFFFF8100
	adds r0, r0, r5
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005E98: .4byte 0x080DC3FC
_08005E9C: .4byte 0xFFFF8100

