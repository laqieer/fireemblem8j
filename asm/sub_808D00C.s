	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_808C834, 0x0808C834 + 1
	.section .text.sub_808D00C, "ax", %progbits
@ sub_808D00C @ JP 0x0808D00C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808D00C
	.thumb_func
sub_808D00C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r4, r2, #0
	mov r8, r3
	mov r0, r8
	asrs r0, r0, #5
	str r0, [sp, #0x14]
	cmp r4, #0x1f
	bgt _0808D02C
	movs r4, #0x20
_0808D02C:
	cmp r4, #0xc0
	ble _0808D032
	movs r4, #0xc0
_0808D032:
	mov r1, r8
	cmp r1, #0xf
	bgt _0808D03C
	movs r2, #0x10
	mov r8, r2
_0808D03C:
	mov r3, r8
	cmp r3, #0x50
	ble _0808D046
	movs r0, #0x50
	mov r8, r0
_0808D046:
	bl sub_808C834
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808D054
	b _0808D330
_0808D054:
	mov r0, r8
	adds r0, #0xf
	cmp r0, #0
	bge _0808D05E
	adds r0, #0xf
_0808D05E:
	asrs r0, r0, #4
	str r0, [sp, #0x10]
	adds r0, r4, #7
	cmp r0, #0
	bge _0808D06A
	adds r0, #7
_0808D06A:
	asrs r0, r0, #3
	adds r1, r0, #1
	str r1, [sp, #0xc]
	movs r7, #0
	subs r0, #3
	ldr r2, [sp, #8]
	subs r2, #8
	str r2, [sp, #0x24]
	ldr r3, [sp, #8]
	add r3, r8
	str r3, [sp, #0x1c]
	ldr r1, [sp, #4]
	subs r1, #8
	str r1, [sp, #0x20]
	cmp r7, r0
	bge _0808D0CE
	mov sl, r0
_0808D08C:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	adds r4, r7, #4
	cmp r5, #0
	blt _0808D0C8
	ldr r2, _0808D114 @ =0x0203E824
	mov sb, r2
_0808D09A:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808D0A4
	mov r0, r8
_0808D0A4:
	subs r0, #0x10
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, sb
	ldrh r0, [r1]
	adds r0, r0, r7
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808D118 @ =0x085B8D24
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808D09A
_0808D0C8:
	adds r7, r4, #0
	cmp r7, sl
	blt _0808D08C
_0808D0CE:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bge _0808D150
	subs r0, #2
	mov sl, r0
_0808D0D8:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	cmp r5, #0
	blt _0808D142
	ldr r1, _0808D114 @ =0x0203E824
	mov sb, r1
	lsls r4, r5, #6
_0808D0E6:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808D0F0
	mov r0, r8
_0808D0F0:
	subs r0, #0x10
	cmp r7, sl
	bge _0808D120
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, sb
	ldrh r0, [r1]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808D11C @ =0x085B8CE4
	bl PutSprite
	b _0808D13A
	.align 2, 0
_0808D114: .4byte 0x0203E824
_0808D118: .4byte 0x085B8D24
_0808D11C: .4byte 0x085B8CE4
_0808D120:
	ldr r1, [sp, #8]
	adds r2, r1, r0
	mov r3, sb
	ldrh r0, [r3]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808D1BC @ =0x085B8CFC
	bl PutSprite
_0808D13A:
	subs r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0808D0E6
_0808D142:
	cmp r7, sl
	bge _0808D148
	adds r7, #1
_0808D148:
	adds r7, #1
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _0808D0D8
_0808D150:
	movs r7, #0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	bge _0808D1FC
	ldr r2, _0808D1C0 @ =0x0203E7E4
	str r2, [sp, #0x18]
_0808D15C:
	lsls r6, r7, #3
	ldr r0, [sp, #0xc]
	subs r0, #2
	cmp r7, r0
	bge _0808D1C8
	ldr r3, [sp, #4]
	adds r3, r3, r6
	mov sb, r3
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	mov sl, r0
	ldrh r5, [r0]
	adds r6, r5, #0
	adds r6, #0x1b
	adds r4, r7, #6
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	cmp r0, #0
	bne _0808D188
	adds r6, #2
_0808D188:
	str r6, [sp]
	movs r0, #2
	mov r1, sb
	ldr r2, [sp, #0x24]
	ldr r3, _0808D1C4 @ =0x085B8D14
	bl PutSprite
	mov r2, sl
	ldrh r1, [r2]
	adds r2, r1, #0
	adds r2, #0x3b
	movs r0, #7
	ands r4, r0
	cmp r4, #0
	bne _0808D1A8
	adds r2, #2
_0808D1A8:
	str r2, [sp]
	movs r0, #2
	mov r1, sb
	ldr r2, [sp, #0x1c]
	ldr r3, _0808D1C4 @ =0x085B8D14
	bl PutSprite
	adds r7, #1
	b _0808D1F4
	.align 2, 0
_0808D1BC: .4byte 0x085B8CFC
_0808D1C0: .4byte 0x0203E7E4
_0808D1C4: .4byte 0x085B8D14
_0808D1C8:
	ldr r3, [sp, #4]
	adds r4, r3, r6
	ldr r1, _0808D270 @ =0x0203E824
	ldrh r0, [r1]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x24]
	ldr r3, _0808D274 @ =0x085B8CDC
	bl PutSprite
	ldr r2, _0808D270 @ =0x0203E824
	ldrh r0, [r2]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	ldr r3, _0808D274 @ =0x085B8CDC
	bl PutSprite
_0808D1F4:
	adds r7, #1
	ldr r3, [sp, #0xc]
	cmp r7, r3
	blt _0808D15C
_0808D1FC:
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808D280
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov sb, r7
	cmp r5, #0
	blt _0808D2CA
_0808D212:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808D21C
	mov r0, r8
_0808D21C:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldr r6, _0808D278 @ =0x085B8CFC
	ldr r0, _0808D27C @ =0x0203E7E4
	adds r7, r0, #0
	adds r7, #0x40
	ldrh r2, [r7]
	movs r0, #1
	ands r0, r5
	adds r1, r2, #0
	adds r1, #0x5f
	cmp r0, #0
	beq _0808D23A
	adds r1, #0x20
_0808D23A:
	str r1, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldr r1, [sp, #4]
	add r1, sb
	ldrh r0, [r7]
	adds r2, r0, #0
	adds r2, #0x1f
	ldr r3, [sp, #0x14]
	cmp r5, r3
	bne _0808D25A
	adds r2, #0x5f
_0808D25A:
	str r2, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808D212
	b _0808D2CA
	.align 2, 0
_0808D270: .4byte 0x0203E824
_0808D274: .4byte 0x085B8CDC
_0808D278: .4byte 0x085B8CFC
_0808D27C: .4byte 0x0203E7E4
_0808D280:
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov sb, r7
	cmp r5, #0
	blt _0808D2CA
	ldr r6, _0808D320 @ =0x085B8CFC
	ldr r7, _0808D324 @ =0x0203E824
_0808D28E:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808D298
	mov r0, r8
_0808D298:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldrh r0, [r7]
	adds r0, #0x5f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	add r1, sb
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808D28E
_0808D2CA:
	ldr r5, _0808D328 @ =0x085B8CDC
	ldr r4, _0808D32C @ =0x0203E7E4
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, #0x5b
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldr r6, [sp, #4]
	add r6, sb
	ldrh r0, [r4]
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5d
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5e
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	b _0808D392
	.align 2, 0
_0808D320: .4byte 0x085B8CFC
_0808D324: .4byte 0x0203E824
_0808D328: .4byte 0x085B8CDC
_0808D32C: .4byte 0x0203E7E4
_0808D330:
	adds r0, r4, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _0808D33A
	adds r0, #0x1f
_0808D33A:
	asrs r0, r0, #5
	str r0, [sp, #0xc]
	bl sub_808C834
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	subs r0, #1
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	subs r7, #1
	cmp r7, #0
	blt _0808D392
_0808D352:
	ldr r5, [sp, #0x10]
	subs r2, r7, #1
	mov r8, r2
	cmp r5, #0
	blt _0808D38C
	lsls r6, r7, #5
	ldr r3, _0808D3A4 @ =0x0203E824
	mov sb, r3
	lsls r0, r5, #4
	ldr r1, [sp, #8]
	adds r4, r0, r1
_0808D368:
	lsls r0, r7, #2
	mov r2, sb
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	adds r2, r4, #0
	ldr r3, _0808D3A8 @ =0x085B8D24
	bl PutSprite
	subs r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _0808D368
_0808D38C:
	mov r7, r8
	cmp r7, #0
	bge _0808D352
_0808D392:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D3A4: .4byte 0x0203E824
_0808D3A8: .4byte 0x085B8D24

