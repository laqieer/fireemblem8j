	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_801964C, 0x0801964C + 1
	.set sub_80737A4, 0x080737A4 + 1
	.section .text.sub_8073B80, "ax", %progbits
@ sub_8073B80 @ JP 0x08073B80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073B80
	.thumb_func
sub_8073B80:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_801964C
	ldr r0, _08073BA0 @ =0x020228A8
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_80737A4
	bl sub_8001EE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073BA0: .4byte 0x020228A8

