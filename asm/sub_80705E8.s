	.syntax unified
	.set CheckRoundCrit, 0x0805B00C + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807069C, 0x0807069C + 1
	.set sub_8070794, 0x08070794 + 1
	.set sub_807083C, 0x0807083C + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80705E8, "ax", %progbits
@ sub_80705E8 @ JP 0x080705E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80705E8
	.thumb_func
sub_80705E8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08070634
	adds r0, r1, #0
	bl sub_807069C
	ldr r0, [r6, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0807061A
	movs r0, #0xba
	lsls r0, r0, #2
	b _0807061C
_0807061A:
	ldr r0, _08070630 @ =0x000002E3
_0807061C:
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	b _08070690
	.align 2, 0
_08070630: .4byte 0x000002E3
_08070634:
	cmp r0, #0x1a
	bne _0807065A
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	bl sub_8070794
	adds r1, r0, #0
	ldr r0, [r6, #0x5c]
	movs r2, #0xa
	str r2, [sp]
	movs r3, #0x2d
	bl sub_807083C
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	movs r2, #1
	bl NewEfxRestWINH_
	b _08070690
_0807065A:
	cmp r0, #0x6f
	bne _08070690
	ldr r5, _08070698 @ =0x02000000
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
_08070690:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070698: .4byte 0x02000000

