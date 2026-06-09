	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8004B70, 0x08004B70 + 1
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027AF4, 0x08027AF4 + 1
	.set sub_8090120, 0x08090120 + 1
	.section .text.sub_8090AEC, "ax", %progbits
@ sub_8090AEC @ JP 0x08090AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8090AEC
	.thumb_func
sub_8090AEC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r7, [r0, #0x14]
	ldr r3, _08090C64 @ =0x08A73BD0
	ldr r0, _08090C68 @ =0x00008580
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #3
	bl PutSprite
	ldr r3, _08090C6C @ =0x08A73BE4
	ldr r0, _08090C70 @ =0x00009580
	str r0, [sp]
	movs r0, #4
	movs r1, #0x96
	movs r2, #0x7c
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08090B36
	ldr r3, _08090C74 @ =0x08A73D34
	movs r0, #0xde
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #0xb
	bl PutSprite
_08090B36:
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	ldr r3, _08090C78 @ =0x08A73B9E
	movs r0, #0xeb
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r2, #0x2c
	bl PutSprite
	ldr r3, _08090C7C @ =0x08A73B64
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x25
	bl PutSprite
	ldr r3, _08090C80 @ =0x08A73B72
	str r4, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x25
	bl PutSprite
	ldr r3, _08090C84 @ =0x08A73B8E
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x73
	bl PutSprite
	ldr r3, _08090C88 @ =0x08A73B96
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x83
	bl PutSprite
	ldr r3, _08090C8C @ =0x08A73B80
	str r4, [sp]
	movs r0, #4
	movs r1, #0x1c
	movs r2, #0x43
	bl PutSprite
	mov r8, r5
	movs r0, #0x34
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0x2b
	adds r1, r1, r7
	mov sl, r1
	ldr r6, _08090C90 @ =0x0000A3C0
	movs r5, #0xa0
	movs r4, #1
_08090BAE:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x3c
	ldr r3, _08090C94 @ =0x085B8D24
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08090BAE
	ldr r3, _08090C94 @ =0x085B8D24
	ldr r0, _08090C98 @ =0x0000A3D0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb4
	movs r2, #0x4b
	bl PutSprite
	ldr r6, _08090C9C @ =0x0000A3D4
	movs r5, #0x9c
	movs r4, #1
_08090BDC:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x5b
	ldr r3, _08090C94 @ =0x085B8D24
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08090BDC
	ldr r4, _08090CA0 @ =0x020230CE
	bl sub_8000CD8
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl sub_8004B70
	movs r0, #1
	bl BG_EnableSyncByMask
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, sb
	ldr r3, [r0]
	cmp r3, #0
	beq _08090C24
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x3d
	bl sub_8027AF4
_08090C24:
	bl sub_8026ED0
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	beq _08090C4E
	ldr r0, _08090CA4 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08090C4E
	ldr r3, _08090CA8 @ =0x08A73B5C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xdb
	movs r2, #3
	bl PutSprite
_08090C4E:
	adds r0, r7, #0
	bl sub_8090120
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090C64: .4byte 0x08A73BD0
_08090C68: .4byte 0x00008580
_08090C6C: .4byte 0x08A73BE4
_08090C70: .4byte 0x00009580
_08090C74: .4byte 0x08A73D34
_08090C78: .4byte 0x08A73B9E
_08090C7C: .4byte 0x08A73B64
_08090C80: .4byte 0x08A73B72
_08090C84: .4byte 0x08A73B8E
_08090C88: .4byte 0x08A73B96
_08090C8C: .4byte 0x08A73B80
_08090C90: .4byte 0x0000A3C0
_08090C94: .4byte 0x085B8D24
_08090C98: .4byte 0x0000A3D0
_08090C9C: .4byte 0x0000A3D4
_08090CA0: .4byte 0x020230CE
_08090CA4: .4byte 0x0202BCEC
_08090CA8: .4byte 0x08A73B5C

