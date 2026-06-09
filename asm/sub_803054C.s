	.syntax unified
	.set CallARM_PushToPrimaryOAM, 0x08002B1C + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_800219C, 0x0800219C + 1
	.section .text.sub_803054C, "ax", %progbits
@ sub_803054C @ JP 0x0803054C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803054C
	.thumb_func
sub_803054C:
	push {r4, r5, r6, r7, lr}
	bl sub_800219C
	cmp r0, #0
	beq _080305AC
	bl sub_8000CD8
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _080305B4 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _080305B8 @ =0x0202BCAC
	movs r6, #0xff
	movs r5, #0x1f
_0803056E:
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	lsls r3, r3, #2
	ldr r2, _080305BC @ =0x00001018
	adds r3, r3, r2
	ldr r2, _080305C0 @ =0x085B8CEC
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0803056E
_080305AC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080305B4: .4byte 0x020027DC
_080305B8: .4byte 0x0202BCAC
_080305BC: .4byte 0x00001018
_080305C0: .4byte 0x085B8CEC

