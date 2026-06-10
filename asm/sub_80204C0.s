	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.section .text.sub_80204C0, "ax", %progbits
@ sub_80204C0 @ JP 0x080204C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80204C0
	.thumb_func
sub_80204C0:
	push {r4, r5, lr}
	ldr r4, _080204E8 @ =0x085C35C4
	movs r5, #0x88
	lsls r5, r5, #6
	movs r0, #0
	movs r1, #0x40
	adds r2, r4, #0
	adds r3, r5, #0
	bl CallARM_PushToSecondaryOAM
	movs r0, #0
	movs r1, #0x40
	adds r2, r4, #0
	adds r3, r5, #0
	bl CallARM_PushToSecondaryOAM
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080204E8: .4byte 0x085C35C4

