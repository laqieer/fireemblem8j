	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.section .text.sub_80B9E28, "ax", %progbits
@ sub_80B9E28 @ JP 0x080B9E28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9E28
	.thumb_func
sub_80B9E28:
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r3, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r2, _080B9E4C @ =0x08ABCA90
	adds r3, #0x68
	movs r4, #0
	ldrsh r3, [r3, r4]
	bl CallARM_PushToSecondaryOAM
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E4C: .4byte 0x08ABCA90

