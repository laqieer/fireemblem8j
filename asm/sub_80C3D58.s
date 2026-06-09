	.syntax unified
	.set GetNodeAtPosition, 0x080C0458 + 1
	.set RedrawGMapPIForNode, 0x080C3D0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C3D58, "ax", %progbits
@ sub_80C3D58 @ JP 0x080C3D58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3D58
	.thumb_func
sub_80C3D58:
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	ldr r1, _080C3DA0 @ =0x03005270
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r2]
	adds r2, #2
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strh r0, [r2]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x48]
	add r1, sp, #4
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r3, #0
	str r3, [sp]
	bl GetNodeAtPosition
	adds r1, r0, #0
	cmp r1, #0
	blt _080C3D98
	adds r0, r4, #0
	bl RedrawGMapPIForNode
	adds r0, r4, #0
	bl sub_8002DE4
_080C3D98:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3DA0: .4byte 0x03005270

