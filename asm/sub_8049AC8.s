	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8049AC8, "ax", %progbits
@ sub_8049AC8 @ JP 0x08049AC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049AC8
	.thumb_func
sub_8049AC8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2a
	ldrsh r1, [r6, r0]
	movs r0, #0x2e
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	movs r4, #0x30
	str r4, [sp]
	movs r0, #5
	bl sub_8012E84
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	movs r0, #0x30
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	str r4, [sp]
	movs r0, #5
	bl sub_8012E84
	adds r1, r0, #0
	ldr r2, _08049B24 @ =0x085B8D24
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsls r3, r3, #2
	ldr r0, _08049B28 @ =0x00009340
	adds r3, r3, r0
	adds r0, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	cmp r0, #0x20
	bls _08049B1C
	adds r0, r6, #0
	bl sub_8002DE4
_08049B1C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049B24: .4byte 0x085B8D24
_08049B28: .4byte 0x00009340

