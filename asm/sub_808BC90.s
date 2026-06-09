	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_808BC90, "ax", %progbits
@ sub_808BC90 @ JP 0x0808BC90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808BC90
	.thumb_func
sub_808BC90:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r8, r2
	mov sb, r3
	mov r0, r8
	adds r0, #7
	movs r1, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	str r1, [sp, #0x14]
	mov r3, r8
	cmp r3, #0x1f
	bgt _0808BCC4
	movs r0, #0x20
	mov r8, r0
_0808BCC4:
	mov r1, r8
	cmp r1, #0xc0
	ble _0808BCCE
	movs r3, #0xc0
	mov r8, r3
_0808BCCE:
	mov r0, sb
	cmp r0, #0xf
	bgt _0808BCD8
	movs r1, #0x10
	mov sb, r1
_0808BCD8:
	mov r3, sb
	cmp r3, #0x30
	ble _0808BCE2
	movs r0, #0x30
	mov sb, r0
_0808BCE2:
	mov r0, r8
	adds r0, #0x1f
	cmp r0, #0
	bge _0808BCEC
	adds r0, #0x1f
_0808BCEC:
	asrs r0, r0, #5
	mov r1, sb
	adds r1, #0xf
	cmp r1, #0
	bge _0808BCF8
	adds r1, #0xf
_0808BCF8:
	asrs r1, r1, #4
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x10]
	mov sl, r1
	subs r6, r0, #1
	str r6, [sp, #0x28]
	ldr r3, [sp, #8]
	subs r3, #8
	str r3, [sp, #0x24]
	ldr r0, [sp, #8]
	add r0, sb
	str r0, [sp, #0x1c]
	ldr r1, [sp, #4]
	subs r1, #8
	str r1, [sp, #0x20]
	ldr r3, [sp, #4]
	add r3, r8
	str r3, [sp, #0x18]
	cmp r6, #0
	blt _0808BDA0
_0808BD20:
	ldr r4, [sp, #0xc]
	subs r0, r6, #1
	str r0, [sp, #0x2c]
	cmp r4, #0
	blt _0808BD96
	lsls r5, r4, #6
	lsls r7, r6, #2
_0808BD2E:
	adds r0, r4, #1
	lsls r2, r0, #4
	cmp r2, sb
	ble _0808BD38
	mov r2, sb
_0808BD38:
	subs r2, #0x10
	adds r0, r6, #1
	lsls r0, r0, #5
	mov r1, sl
	cmp r1, #0
	beq _0808BD6C
	subs r0, #0x20
	ldr r3, [sp, #4]
	adds r1, r3, r0
	ldr r0, [sp, #8]
	adds r2, r0, r2
	ldr r3, _0808BD64 @ =0x0203E790
	ldrh r0, [r3, #0x30]
	adds r0, r0, r7
	adds r0, r0, r5
	str r0, [sp]
	movs r0, #0
	ldr r3, _0808BD68 @ =0x085B8CE4
	bl PutSprite
	b _0808BD8E
	.align 2, 0
_0808BD64: .4byte 0x0203E790
_0808BD68: .4byte 0x085B8CE4
_0808BD6C:
	cmp r0, r8
	ble _0808BD72
	mov r0, r8
_0808BD72:
	subs r0, #0x20
	ldr r3, [sp, #4]
	adds r1, r3, r0
	ldr r0, [sp, #8]
	adds r2, r0, r2
	ldr r3, _0808BDE8 @ =0x0203E790
	ldrh r0, [r3, #0x30]
	adds r0, r0, r7
	adds r0, r0, r5
	str r0, [sp]
	movs r0, #0
	ldr r3, _0808BDEC @ =0x085B8D24
	bl PutSprite
_0808BD8E:
	subs r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0808BD2E
_0808BD96:
	movs r0, #0
	mov sl, r0
	ldr r6, [sp, #0x2c]
	cmp r6, #0
	bge _0808BD20
_0808BDA0:
	ldr r1, [sp, #0x10]
	mov sl, r1
	ldr r6, [sp, #0x28]
	cmp r6, #0
	blt _0808BE2E
	ldr r5, _0808BDE8 @ =0x0203E790
	ldr r7, _0808BDF0 @ =0x085B8D34
_0808BDAE:
	adds r0, r6, #1
	lsls r0, r0, #5
	mov r3, sl
	cmp r3, #0
	beq _0808BDF8
	subs r0, #0x20
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x24]
	ldr r3, _0808BDF4 @ =0x085B8D14
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	ldr r3, _0808BDF4 @ =0x085B8D14
	bl PutSprite
	movs r3, #0
	mov sl, r3
	b _0808BE28
	.align 2, 0
_0808BDE8: .4byte 0x0203E790
_0808BDEC: .4byte 0x085B8D24
_0808BDF0: .4byte 0x085B8D34
_0808BDF4: .4byte 0x085B8D14
_0808BDF8:
	cmp r0, r8
	ble _0808BDFE
	mov r0, r8
_0808BDFE:
	subs r0, #0x20
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x24]
	adds r3, r7, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	adds r3, r7, #0
	bl PutSprite
_0808BE28:
	subs r6, #1
	cmp r6, #0
	bge _0808BDAE
_0808BE2E:
	ldr r4, [sp, #0xc]
	cmp r4, #0
	blt _0808BE8C
_0808BE34:
	adds r0, r4, #1
	lsls r2, r0, #4
	cmp r2, sb
	ble _0808BE3E
	mov r2, sb
_0808BE3E:
	subs r2, #0x10
	ldr r3, [sp, #8]
	adds r5, r3, r2
	ldr r7, _0808BF38 @ =0x085B8CFC
	ldr r6, _0808BF3C @ =0x0203E790
	ldrh r0, [r6, #0x30]
	adds r0, #0x5f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x20]
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0808BE86
	ldrh r0, [r6, #0x30]
	adds r0, #0x1a
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x18]
	subs r1, #8
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
_0808BE86:
	subs r4, #1
	cmp r4, #0
	bge _0808BE34
_0808BE8C:
	ldr r6, _0808BF40 @ =0x085B8CDC
	ldr r5, _0808BF3C @ =0x0203E790
	ldrh r0, [r5, #0x30]
	adds r0, #0x5b
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5d
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	adds r3, r6, #0
	bl PutSprite
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _0808BF06
	ldr r4, [sp, #0x18]
	subs r4, #8
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x24]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	adds r3, r6, #0
	bl PutSprite
_0808BF06:
	ldr r0, [sp, #0x50]
	cmp r0, #0
	bne _0808BF26
	ldr r2, [sp, #8]
	subs r2, #0xb
	ldr r3, _0808BF44 @ =0x085B8D24
	ldr r0, _0808BF3C @ =0x0203E790
	ldrh r1, [r0, #0x30]
	ldr r0, _0808BF48 @ =0x000003FF
	ands r0, r1
	adds r0, #0x7b
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #4]
	bl PutSprite
_0808BF26:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BF38: .4byte 0x085B8CFC
_0808BF3C: .4byte 0x0203E790
_0808BF40: .4byte 0x085B8CDC
_0808BF44: .4byte 0x085B8D24
_0808BF48: .4byte 0x000003FF

