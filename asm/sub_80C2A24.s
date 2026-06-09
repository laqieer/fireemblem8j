	.syntax unified
	.set GetGmUnitFaction, 0x080C2018 + 1
	.set MapUnitC_SetFaction, 0x080BFE68 + 1
	.set sub_80C20F8, 0x080C20F8 + 1
	.set sub_80C2180, 0x080C2180 + 1
	.set sub_80C2B14, 0x080C2B14 + 1
	.set sub_80C2ED0, 0x080C2ED0 + 1
	.section .text.sub_80C2A24, "ax", %progbits
@ sub_80C2A24 @ JP 0x080C2A24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2A24
	.thumb_func
sub_80C2A24:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r5, r1, #0
	adds r7, r3, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov sb, r2
	lsls r6, r5, #2
	adds r0, #0x2c
	adds r0, r0, r6
	ldr r4, [r0]
	movs r0, #0x2a
	adds r0, r0, r4
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080C2A58
	mov r0, sl
	bl sub_80C2B14
_080C2A58:
	mov r1, r8
	strb r5, [r1]
	mov r2, sb
	cmp r2, #0
	beq _080C2A80
	adds r0, r4, #0
	adds r1, r7, #0
	ldr r2, [sp, #0x24]
	bl sub_80C2180
	ldr r0, _080C2A7C @ =0x03005270
	adds r0, r6, r0
	strh r7, [r0, #0x12]
	ldrb r1, [r0, #0x10]
	movs r2, #2
	orrs r1, r2
	b _080C2A96
	.align 2, 0
_080C2A7C: .4byte 0x03005270
_080C2A80:
	adds r0, r4, #0
	adds r1, r7, #0
	ldr r2, [sp, #0x24]
	bl sub_80C20F8
	ldr r0, _080C2B0C @ =0x03005270
	adds r0, r6, r0
	strh r7, [r0, #0x12]
	ldrb r2, [r0, #0x10]
	movs r1, #0xfd
	ands r1, r2
_080C2A96:
	strb r1, [r0, #0x10]
	ldr r1, _080C2B0C @ =0x03005270
	lsls r0, r5, #2
	adds r0, r0, r1
	add r1, sp, #0x24
	ldrb r1, [r1]
	strb r1, [r0, #0x11]
	ldr r2, [sp, #0x20]
	cmp r2, #0
	bge _080C2AB2
	adds r0, r5, #0
	bl GetGmUnitFaction
	str r0, [sp, #0x20]
_080C2AB2:
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #0x20]
	bl MapUnitC_SetFaction
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r2, [r0]
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080C2B10 @ =0x08AC1CB0
	adds r0, r5, r0
	ldrb r2, [r0]
	mov r0, sl
	adds r1, r5, #0
	bl sub_80C2ED0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2B0C: .4byte 0x03005270
_080C2B10: .4byte 0x08AC1CB0

