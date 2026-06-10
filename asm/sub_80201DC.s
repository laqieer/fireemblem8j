	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80201DC, "ax", %progbits
@ sub_80201DC @ JP 0x080201DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80201DC
	.thumb_func
sub_80201DC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	mov r8, r3
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x46
	str r5, [sp]
	movs r0, #5
	movs r1, #0x78
	bl sub_8012E84
	adds r7, r0, #0
	movs r2, #0
	ldrsh r3, [r4, r2]
	str r5, [sp]
	movs r0, #5
	movs r1, #0x50
	mov r2, r8
	bl sub_8012E84
	mov sl, r0
	adds r0, r7, #0
	subs r0, #8
	ldr r4, _08020264 @ =0x000001FF
	ands r0, r4
	lsls r6, r6, #9
	orrs r0, r6
	mov r1, sl
	subs r1, #8
	ands r1, r4
	adds r5, #0xba
	orrs r1, r5
	ldr r2, _08020268 @ =0x085B8CE4
	mov r8, r2
	ldr r2, _0802026C @ =0x00002218
	mov sb, r2
	mov r2, r8
	mov r3, sb
	bl CallARM_PushToSecondaryOAM
	movs r0, #0xe8
	subs r0, r0, r7
	ands r0, r4
	orrs r0, r6
	movs r1, #0x98
	mov r2, sl
	subs r1, r1, r2
	ands r1, r4
	orrs r1, r5
	mov r2, r8
	mov r3, sb
	bl CallARM_PushToSecondaryOAM
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020264: .4byte 0x000001FF
_08020268: .4byte 0x085B8CE4
_0802026C: .4byte 0x00002218

