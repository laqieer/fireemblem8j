	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set CheckEkrHitDone, 0x08052FC4 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateUnHidden, 0x0805B138 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80702E8, "ax", %progbits
@ sub_80702E8 @ JP 0x080702E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80702E8
	.thumb_func
sub_80702E8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bl CheckEkrHitDone
	cmp r0, #1
	bne _08070322
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _08070328 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl sub_8002DE4
_08070322:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070328: .4byte 0x02000010

