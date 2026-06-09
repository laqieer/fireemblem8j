	.syntax unified
	.set LoadBonusContentData, 0x080A8338 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set UnlockSoundRoomSong, 0x080A894C + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80AF034, "ax", %progbits
@ sub_80AF034 @ JP 0x080AF034 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF034
	.thumb_func
sub_80AF034:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080AF0D4 @ =0x08A9D3E4
	ldr r1, [r4]
	ldr r2, _080AF0D8 @ =0x010000A2
	mov r0, sp
	bl sub_80D6370
	ldr r0, [r4]
	bl LoadBonusContentData
	cmp r0, #0
	beq _080AF0CA
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov sb, r0
	movs r7, #0xf
_080AF06C:
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	movs r4, #3
	ands r4, r0
	cmp r4, #1
	bne _080AF0B6
	ldrb r0, [r2, #1]
	cmp r0, #3
	bne _080AF096
	str r4, [r5, #0x58]
	ldrb r1, [r2]
	mov r0, sb
	ands r0, r1
	adds r0, #2
	strb r0, [r2]
	movs r0, #0
	movs r1, #0x75
	bl UnlockSoundRoomSong
_080AF096:
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2, #1]
	cmp r0, #4
	bne _080AF0B6
	str r4, [r5, #0x5c]
	ldrb r1, [r2]
	mov r0, sb
	ands r0, r1
	adds r0, #2
	strb r0, [r2]
	movs r0, #0
	movs r1, #0x76
	bl UnlockSoundRoomSong
_080AF0B6:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080AF06C
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080AF0DC
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080AF0DC
_080AF0CA:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080AF0E4
	.align 2, 0
_080AF0D4: .4byte 0x08A9D3E4
_080AF0D8: .4byte 0x010000A2
_080AF0DC:
	ldr r0, _080AF0F4 @ =0x06014000
	movs r1, #9
	bl sub_808BB14
_080AF0E4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF0F4: .4byte 0x06014000

