	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateUnHidden, 0x0805B138 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807054C, "ax", %progbits
@ sub_807054C @ JP 0x0807054C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807054C
	.thumb_func
sub_807054C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080705B8
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r6, #0x60]
	bl AnimDelete
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _080705C0 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r5, _080705C4 @ =0x02000000
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl sub_8002DE4
_080705B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080705C0: .4byte 0x02000010
_080705C4: .4byte 0x02000000

