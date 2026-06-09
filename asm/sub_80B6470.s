	.syntax unified
	.set GetGameOption, 0x080B6A00 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80B6470, "ax", %progbits
@ sub_80B6470 @ JP 0x080B6470 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B6470
	.thumb_func
sub_80B6470:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	ldr r1, _080B6530 @ =0x08AAF6DC
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _080B6534 @ =0x08AAF700
	movs r0, #0x2c
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldrb r0, [r4, #8]
	lsrs r0, r0, #3
	str r0, [sp, #8]
	ldr r1, _080B6538 @ =0x08AAF6D8
	ldr r2, [sp]
	lsls r0, r2, #3
	adds r5, r0, #0
	adds r5, #0x70
	ldr r0, [r1]
	adds r0, r0, r5
	bl sub_8003CF8
	movs r0, #0
	mov r8, r0
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _080B6500
	mov sl, r5
_080B64B8:
	ldr r0, _080B6538 @ =0x08AAF6D8
	ldr r0, [r0]
	mov r1, sl
	adds r7, r0, r1
	ldrb r0, [r4, #8]
	adds r6, r0, #0
	subs r6, #0x70
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl GetGameOption
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #1
	cmp r8, r0
	bne _080B64DC
	movs r5, #2
_080B64DC:
	ldrh r0, [r4, #6]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80043B8
	adds r4, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	bgt _080B6500
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080B64B8
_080B6500:
	ldr r0, _080B6538 @ =0x08AAF6D8
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r1, #0x70
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r2, [sp, #4]
	lsls r1, r2, #5
	ldr r2, [sp, #8]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080B653C @ =0x020234A8
	adds r1, r1, r2
	bl PutText
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6530: .4byte 0x08AAF6DC
_080B6534: .4byte 0x08AAF700
_080B6538: .4byte 0x08AAF6D8
_080B653C: .4byte 0x020234A8

