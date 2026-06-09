	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80AE42C, "ax", %progbits
@ sub_80AE42C @ JP 0x080AE42C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE42C
	.thumb_func
sub_80AE42C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #4
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080AE46E
	ldr r0, _080AE474 @ =0x08AA59A0
	ldr r1, _080AE478 @ =0x06014000
	bl sub_8013008
	adds r0, r5, #0
	bl sub_8002DE4
_080AE46E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE474: .4byte 0x08AA59A0
_080AE478: .4byte 0x06014000

