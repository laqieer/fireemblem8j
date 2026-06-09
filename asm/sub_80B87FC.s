	.syntax unified
	.set SetBanimTerrainPos, 0x0805BBE4 + 1
	.set SetMainMiniAnimPos, 0x0805B6E4 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B8C78, 0x080B8C78 + 1
	.section .text.sub_80B87FC, "ax", %progbits
@ sub_80B87FC @ JP 0x080B87FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B87FC
	.thumb_func
sub_80B87FC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x46
	adds r0, r0, r7
	mov sb, r0
	ldrh r1, [r7, #0x2a]
	movs r0, #0x50
	subs r0, r0, r1
	movs r1, #0xe
	bl __divsi3
	mvns r0, r0
	mov r1, sb
	ldrb r1, [r1]
	adds r0, r0, r1
	mov r2, sb
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	bhi _080B8834
	movs r0, #0xb4
	strb r0, [r2]
_080B8834:
	ldr r0, _080B88E4 @ =0x03003020
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #1
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #2
	mov sl, r1
	mov r2, sl
	orrs r0, r2
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	ldrh r6, [r7, #0x2a]
	adds r1, r6, #0
	movs r0, #0x50
	subs r0, r0, r1
	mov r2, ip
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	adds r1, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x34
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	mov r2, sl
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x36
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bne _080B88EC
	movs r0, #0xb4
	mov r1, sb
	strb r0, [r1]
	movs r2, #0
	strh r2, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	ldr r0, _080B88E8 @ =sub_80B87C0
	adds r1, r7, #0
	bl sub_80B1D98
	b _080B88F0
	.align 2, 0
_080B88E4: .4byte 0x03003020
_080B88E8: .4byte 0x080B87C1  @ sub_80B87C0
_080B88EC:
	adds r0, r6, #4
	strh r0, [r7, #0x2a]
_080B88F0:
	ldr r0, _080B8928 @ =0x02000000
	adds r4, r7, #0
	adds r4, #0x46
	ldrb r1, [r4]
	movs r2, #0x58
	bl SetMainMiniAnimPos
	ldr r0, _080B892C @ =0x0201DB00
	ldrb r3, [r4]
	adds r1, r3, #0
	subs r1, #0x30
	adds r3, #0x30
	movs r2, #0x68
	str r2, [sp]
	bl SetBanimTerrainPos
	ldr r0, [r7, #0x3c]
	movs r1, #0x64
	bl sub_80B8C78
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8928: .4byte 0x02000000
_080B892C: .4byte 0x0201DB00

