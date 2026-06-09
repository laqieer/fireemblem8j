	.syntax unified
	.section .text.CheckEkrTriangleInvalid, "ax", %progbits
@ CheckEkrTriangleInvalid @ JP 0x08077374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CheckEkrTriangleInvalid
	.thumb_func
CheckEkrTriangleInvalid:
	push {lr}
	ldr r0, _08077384 @ =0x0202013C
	ldr r0, [r0]
	cmp r0, #1
	beq _08077388
	movs r0, #0
	b _0807738A
	.align 2, 0
_08077384: .4byte 0x0202013C
_08077388:
	movs r0, #1
_0807738A:
	pop {r1}
	bx r1
	.align 2, 0

