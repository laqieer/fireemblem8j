	.syntax unified
	.set CallARM_PushToPrimaryOAM, 0x08002B1C + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_800219C, 0x0800219C + 1
	.section .text.sub_8030344, "ax", %progbits
@ sub_8030344 @ JP 0x08030344 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030344
	.thumb_func
sub_8030344:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_800219C
	cmp r0, #0
	beq _080303AC
	bl sub_8000CD8
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _080303B8 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _080303BC @ =0x0202BCAC
	movs r6, #0xff
	movs r5, #0x1f
	ldr r0, _080303C0 @ =0x085C5E48
	mov r8, r0
_0803036E:
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
	ldrb r2, [r4, #8]
	lsls r2, r2, #2
	add r2, r8
	ldr r2, [r2]
	movs r3, #0
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0803036E
_080303AC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080303B8: .4byte 0x020027DC
_080303BC: .4byte 0x0202BCAC
_080303C0: .4byte 0x085C5E48

