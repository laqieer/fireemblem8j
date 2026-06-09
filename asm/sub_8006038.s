	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_80056AC, 0x080056AC + 1
	.section .text.sub_8006038, "ax", %progbits
@ sub_8006038 @ JP 0x08006038 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006038
	.thumb_func
sub_8006038:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	mov sb, r0
	cmp r5, #1
	beq _08006066
	cmp r5, #1
	bgt _08006058
	cmp r5, #0
	beq _08006062
	b _0800612E
_08006058:
	cmp r5, #0x80
	beq _0800606A
	cmp r5, #0x81
	beq _08006072
	b _0800612E
_08006062:
	movs r5, #0x58
	b _08006078
_08006066:
	movs r5, #0x18
	b _08006078
_0800606A:
	movs r5, #0x58
	movs r1, #1
	mov sb, r1
	b _08006078
_08006072:
	movs r5, #0x18
	movs r3, #1
	mov sb, r3
_08006078:
	ldr r0, [r7, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x16]
	movs r1, #4
	subs r4, r1, r2
	bl sub_80056AC
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne _08006092
	rsbs r4, r4, #0
_08006092:
	lsls r1, r4, #3
	ldr r0, [r7, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r4, r1, #0
	subs r4, #0x10
	ldr r1, _08006110 @ =0x000001FF
	ands r4, r1
	bl sub_80056AC
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080060B6
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r4, r0
_080060B6:
	ldr r0, [r7, #0x2c]
	bl sub_80056AC
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	rsbs r0, r0, #0
	asrs r6, r0, #0x1f
	ands r6, r1
	ldr r2, [r7, #0x2c]
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	ldr r0, [r2, #0x2c]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r6, r6, r1
	mov r0, sb
	cmp r0, #0
	beq _08006118
	adds r0, r2, #0
	bl sub_80056AC
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080060F2
	adds r4, #0x10
_080060F2:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006114 @ =0x085B8CE4
	ldrh r1, [r1, #0x3c]
	adds r1, r1, r5
	adds r1, #2
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	b _0800612E
	.align 2, 0
_08006110: .4byte 0x000001FF
_08006114: .4byte 0x085B8CE4
_08006118:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _0800613C @ =0x085B8D24
	ldrh r1, [r2, #0x3c]
	adds r1, r1, r5
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
_0800612E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800613C: .4byte 0x085B8D24

