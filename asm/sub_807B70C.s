	.syntax unified
	.set sub_8026F98, 0x08026F98 + 1
	.set sub_8027D48, 0x08027D48 + 1
	.set sub_807B660, 0x0807B660 + 1
	.section .text.sub_807B70C, "ax", %progbits
@ sub_807B70C @ JP 0x0807B70C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B70C
	.thumb_func
sub_807B70C:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B7A6
	add r4, sp, #8
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_807B660
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807B7A6
	add r0, sp, #8
	ldrh r1, [r0]
	ldr r0, _0807B7B0 @ =0x000001FF
	ands r0, r1
	add r1, sp, #8
	strh r0, [r1]
	ldrh r0, [r4, #2]
	movs r1, #0xff
	ands r1, r0
	strh r1, [r4, #2]
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #7
	bne _0807B756
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	movs r0, #0
	orrs r1, r0
	strh r1, [r4, #2]
_0807B756:
	adds r6, r7, #0
	adds r6, #0x3c
	ldrb r0, [r6]
	ldr r1, [r7, #0x38]
	bl sub_8026F98
	ldr r0, [r7, #0x30]
	ldrh r0, [r0, #0x1e]
	add r1, sp, #8
	movs r3, #0
	ldrsh r1, [r1, r3]
	subs r1, #8
	movs r3, #2
	ldrsh r2, [r4, r3]
	subs r2, #0x10
	ldr r3, [r7, #0x38]
	ldr r4, _0807B7B4 @ =0xF9FF0000
	adds r3, r3, r4
	lsls r3, r3, #0xf
	lsrs r3, r3, #0x14
	ldr r4, [r7, #0x34]
	ldrb r5, [r4, #1]
	movs r4, #0xf
	ands r4, r5
	lsls r4, r4, #0xc
	adds r5, r7, #0
	adds r5, #0x46
	orrs r3, r4
	ldrh r5, [r5]
	adds r3, r3, r5
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r4, r7, #0
	adds r4, #0x41
	ldrb r4, [r4]
	str r4, [sp]
	ldrb r4, [r6]
	str r4, [sp, #4]
	bl sub_8027D48
_0807B7A6:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B7B0: .4byte 0x000001FF
_0807B7B4: .4byte 0xF9FF0000

