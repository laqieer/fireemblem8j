	.syntax unified
	.set sub_800BDE8, 0x0800BDE8 + 1
	.set sub_800BE34, 0x0800BE34 + 1
	.set sub_802E468, 0x0802E468 + 1
	.section .text.sub_800F4D0, "ax", %progbits
@ sub_800F4D0 @ JP 0x0800F4D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F4D0
	.thumb_func
sub_800F4D0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #1
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r6, #0xf
	ands r6, r0
	movs r0, #2
	ldrsh r2, [r1, r0]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0800F510
	cmp r2, r0
	bgt _0800F4FA
	subs r0, #1
	cmp r2, r0
	beq _0800F52C
	b _0800F542
_0800F4FA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0800F542
	ldr r1, _0800F50C @ =0x030004DC
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	b _0800F518
	.align 2, 0
_0800F50C: .4byte 0x030004DC
_0800F510:
	ldr r0, _0800F528 @ =0x03004DF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	ldrb r1, [r1, #0x11]
_0800F518:
	bl sub_802E468
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0800F542
	movs r0, #6
	b _0800F5E0
	.align 2, 0
_0800F528: .4byte 0x03004DF0
_0800F52C:
	ldr r1, _0800F560 @ =0x030004E8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, _0800F564 @ =0x030004B0
	ldr r0, [r0, #0x34]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0800F542:
	ldrh r1, [r5, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F59C
	movs r4, #0
	cmp r4, r7
	bhs _0800F5DE
_0800F554:
	cmp r6, #0
	beq _0800F568
	cmp r6, #1
	beq _0800F576
	b _0800F582
	.align 2, 0
_0800F560: .4byte 0x030004E8
_0800F564: .4byte 0x030004B0
_0800F568:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	adds r2, r5, #0
	bl sub_800BDE8
	b _0800F582
_0800F576:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	adds r2, r5, #0
	bl sub_800BE34
_0800F582:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _0800F554
	b _0800F5DE
_0800F59C:
	movs r1, #1
	movs r4, #0
	cmp r4, r7
	bhs _0800F5DE
_0800F5A4:
	cmp r6, #0
	beq _0800F5AE
	cmp r6, #1
	beq _0800F5BA
	b _0800F5C4
_0800F5AE:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	adds r2, r5, #0
	bl sub_800BDE8
	b _0800F5C4
_0800F5BA:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	adds r2, r5, #0
	bl sub_800BE34
_0800F5C4:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r1, #0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _0800F5A4
_0800F5DE:
	movs r0, #2
_0800F5E0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

