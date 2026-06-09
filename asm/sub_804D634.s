	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_804D058, 0x0804D058 + 1
	.set sub_804D584, 0x0804D584 + 1
	.set sub_804D5DC, 0x0804D5DC + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_804D634, "ax", %progbits
@ sub_804D634 @ JP 0x0804D634 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D634
	.thumb_func
sub_804D634:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0804D784 @ =0x0203DA20
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804D64C
	b _0804D7A8
_0804D64C:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq _0804D666
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_0804D666:
	ldr r3, _0804D788 @ =0x085D4A7C
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge _0804D6CA
	movs r5, #0x20
_0804D67E:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #6
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _0804D78C @ =0x085D4AF4
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804D6C0
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #6
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _0804D790 @ =0x085D4B02
	bl PutSprite
_0804D6C0:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804D67E
_0804D6CA:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq _0804D77E
	ldr r0, _0804D794 @ =0x0203DDD8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D6FC
	bl sub_8000CD8
	ldr r2, _0804D798 @ =0x020228A8
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, _0804D79C @ =0x08A987D8
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #0xc7
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl sub_8001EE4
_0804D6FC:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt _0804D706
	adds r0, #0x10
	str r0, [r7, #0x40]
_0804D706:
	ldr r4, _0804D7A0 @ =0x080DC15C
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	ldr r3, _0804D7A4 @ =0x080DF0E6
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl PutSprite
_0804D77E:
	bl sub_804D5DC
	b _0804D836
	.align 2, 0
_0804D784: .4byte 0x0203DA20
_0804D788: .4byte 0x085D4A7C
_0804D78C: .4byte 0x085D4AF4
_0804D790: .4byte 0x085D4B02
_0804D794: .4byte 0x0203DDD8
_0804D798: .4byte 0x020228A8
_0804D79C: .4byte 0x08A987D8
_0804D7A0: .4byte 0x080DC15C
_0804D7A4: .4byte 0x080DF0E6
_0804D7A8:
	ldr r3, _0804D810 @ =0x085D4A7C
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge _0804D832
	ldr r2, _0804D814 @ =0x085D4AEC
	mov sl, r2
	movs r0, #8
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0x30
	mov r8, r1
_0804D7D4:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r0, [r4]
	lsls r0, r0, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl PutSprite
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804D818
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0804D826
	adds r0, r1, #1
	b _0804D824
	.align 2, 0
_0804D810: .4byte 0x085D4A7C
_0804D814: .4byte 0x085D4AEC
_0804D818:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, sb
	ble _0804D826
	subs r0, r1, #1
_0804D824:
	strh r0, [r5]
_0804D826:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804D7D4
_0804D832:
	bl sub_804D584
_0804D836:
	ldr r0, _0804D884 @ =0x0203DA20
	ldrb r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	cmp r0, #1
	bne _0804D84A
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
_0804D84A:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0804D85C
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_804D058
_0804D85C:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt _0804D874
	adds r2, r0, #0
	adds r2, #8
	ldr r3, _0804D888 @ =0x085D4AB2
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl PutSprite
_0804D874:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D884: .4byte 0x0203DA20
_0804D888: .4byte 0x085D4AB2

