	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.section .text.sub_8031944, "ax", %progbits
@ sub_8031944 @ JP 0x08031944 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031944
	.thumb_func
sub_8031944:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #9
	bl NextRN_N
	adds r4, r4, r0
	subs r0, r4, #4
	cmp r0, #0
	bgt _08031958
	movs r0, #1
_08031958:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

