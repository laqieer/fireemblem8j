	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8024BF0, "ax", %progbits
@ sub_8024BF0 @ JP 0x08024BF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024BF0
	.thumb_func
sub_8024BF0:
	push {lr}
	bl sub_80C1E74
	cmp r0, #1
	bne _08024C5C
	ldr r0, _08024C60 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _08024C64
	movs r0, #0x71
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024C5C
	movs r0, #0x72
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024C5C
	movs r0, #0x73
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024C5C
	movs r0, #0x74
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024C5C
	movs r0, #0x75
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024C5C
	movs r0, #0x76
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024C5C
	movs r0, #0x77
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024C64
_08024C5C:
	movs r0, #3
	b _08024C66
	.align 2, 0
_08024C60: .4byte 0x0202BCEC
_08024C64:
	movs r0, #1
_08024C66:
	pop {r1}
	bx r1
	.align 2, 0

