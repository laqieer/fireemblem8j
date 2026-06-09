	.syntax unified
	.set AiGetTerrainCombatPositionScoreComponent, 0x0803E1CC + 1
	.set sub_803E20C, 0x0803E20C + 1
	.section .text.sub_803FA68, "ax", %progbits
@ sub_803FA68 @ JP 0x0803FA68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803FA68
	.thumb_func
sub_803FA68:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r8, r2
	movs r0, #0
	mov sl, r0
	ldr r2, _0803FB0C @ =0x085D31C4
	movs r1, #3
	mov sb, r1
_0803FA84:
	ldr r0, [r2]
	ldr r1, [sp]
	adds r5, r1, r0
	ldr r0, [r2, #4]
	ldr r1, [sp, #4]
	adds r7, r1, r0
	ldr r0, _0803FB10 @ =0x0202E4DC
	ldr r0, [r0]
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0803FAF2
	ldr r0, _0803FB14 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803FABA
	ldr r0, _0803FB18 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803FAF2
_0803FABA:
	adds r0, r5, #0
	adds r1, r7, #0
	str r2, [sp, #8]
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_803E20C
	adds r4, r4, r0
	ldr r0, _0803FB1C @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803FB20 @ =0x7FFFFFFF
	adds r4, r4, r0
	ldr r2, [sp, #8]
	cmp sl, r4
	bhs _0803FAF2
	mov r1, r8
	strh r5, [r1]
	strh r7, [r1, #2]
	mov sl, r4
_0803FAF2:
	adds r2, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	bge _0803FA84
	mov r0, sl
	cmp r0, #0
	bne _0803FB24
	movs r0, #0
	b _0803FB26
	.align 2, 0
_0803FB0C: .4byte 0x085D31C4
_0803FB10: .4byte 0x0202E4DC
_0803FB14: .4byte 0x0202E4D4
_0803FB18: .4byte 0x0202BE40
_0803FB1C: .4byte 0x0202E4EC
_0803FB20: .4byte 0x7FFFFFFF
_0803FB24:
	movs r0, #1
_0803FB26:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

