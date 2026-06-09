	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.section .text.sub_8081A28, "ax", %progbits
@ sub_8081A28 @ JP 0x08081A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081A28
	.thumb_func
sub_8081A28:
	push {lr}
	adds r2, r1, #0
	movs r1, #4
	rsbs r1, r1, #0
	cmp r0, r1
	blt _08081A54
	cmp r0, #0xeb
	bgt _08081A54
	cmp r2, r1
	blt _08081A54
	cmp r2, #0x9b
	bgt _08081A54
	subs r0, #4
	ldr r1, _08081A58 @ =0x000001FF
	ands r0, r1
	subs r1, r2, #4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08081A5C @ =0x085B8CDC
	ldr r3, _08081A60 @ =0x000041C0
	bl CallARM_PushToSecondaryOAM
_08081A54:
	pop {r0}
	bx r0
	.align 2, 0
_08081A58: .4byte 0x000001FF
_08081A5C: .4byte 0x085B8CDC
_08081A60: .4byte 0x000041C0

