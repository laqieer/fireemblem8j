	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80451D4, "ax", %progbits
@ sub_80451D4 @ JP 0x080451D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80451D4
	.thumb_func
sub_80451D4:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x2c]
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _080451F4
	ldr r0, [r6, #0x3c]
	cmp r0, #0x20
	ble _080451EE
	adds r0, r6, #0
	bl sub_8002DE4
_080451EE:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _080451FA
_080451F4:
	ldr r0, [r6, #0x34]
	adds r0, #1
	str r0, [r6, #0x34]
_080451FA:
	ldr r0, [r6, #0x38]
	subs r0, #1
	str r0, [r6, #0x38]
	cmp r0, #0
	bge _08045208
	movs r0, #0
	str r0, [r6, #0x38]
_08045208:
	ldr r4, [r6, #0x38]
	cmp r4, #0
	beq _08045210
	b _0804531E
_08045210:
	ldr r3, [r6, #0x3c]
	cmp r3, #0x20
	bgt _08045228
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_8012E84
	str r0, [r6, #0x30]
_08045228:
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	subs r2, #0x10
	ldr r3, _080452D0 @ =0x085D35EC
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x48
	ldr r2, [r6, #0x34]
	subs r2, #6
	ldr r3, _080452D4 @ =0x085D35DC
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x60
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _080452D8 @ =0x080DEDC0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x40
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _080452DC @ =0x080DEDDC
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _080452E0 @ =0x085D4AF4
	ldrb r4, [r5]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r6, #0x30]
	rsbs r0, r0, #0
	adds r4, r0, #0
	adds r4, #0x7c
	ldr r2, [r6, #0x34]
	ldr r3, _080452E4 @ =0x080DEDC8
	ldrb r0, [r5]
	cmp r0, #3
	beq _080452E8
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	b _080452EA
	.align 2, 0
_080452D0: .4byte 0x085D35EC
_080452D4: .4byte 0x085D35DC
_080452D8: .4byte 0x080DEDC0
_080452DC: .4byte 0x080DEDDC
_080452E0: .4byte 0x085D4AF4
_080452E4: .4byte 0x080DEDC8
_080452E8:
	movs r0, #0x40
_080452EA:
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _08045328 @ =0x080DEDE4
	ldrb r4, [r5]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
_0804531E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045328: .4byte 0x080DEDE4

