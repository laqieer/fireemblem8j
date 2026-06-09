	.syntax unified
	.set MPlayExtender, 0x080D512C + 1
	.set MPlayOpen, 0x080D55B0 + 1
	.set SoundInit, 0x080D5270 + 1
	.set m4aSoundMode, 0x080D540C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.m4aSoundInit, "ax", %progbits
@ m4aSoundInit @ JP 0x080D4E70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aSoundInit
	.thumb_func
m4aSoundInit:
	push {r4, r5, r6, lr}
	ldr r0, _080D4EC4 @ =SoundMainRAM
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _080D4EC8 @ =0x03002C08
	ldr r2, _080D4ECC @ =0x04000100
	bl sub_80D6370
	ldr r0, _080D4ED0 @ =0x03005400
	bl SoundInit
	ldr r0, _080D4ED4 @ =0x03006500
	bl MPlayExtender
	ldr r0, _080D4ED8 @ =0x0094D700
	bl m4aSoundMode
	ldr r0, _080D4EDC @ =0x00000009
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080D4EBE
	ldr r5, _080D4EE0 @ =0x082140B4
	adds r6, r0, #0
_080D4EA2:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	bl MPlayOpen
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _080D4EE4 @ =0x03006700
	str r0, [r4, #0x18]
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bne _080D4EA2
_080D4EBE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4EC4: .4byte 0x080D4245  @ SoundMainRAM
_080D4EC8: .4byte 0x03002C08
_080D4ECC: .4byte 0x04000100
_080D4ED0: .4byte 0x03005400
_080D4ED4: .4byte 0x03006500
_080D4ED8: .4byte 0x0094D700
_080D4EDC: .4byte 0x00000009
_080D4EE0: .4byte 0x082140B4
_080D4EE4: .4byte 0x03006700

