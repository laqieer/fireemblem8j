	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_8013008, "ax", %progbits
@ sub_8013008 @ JP 0x08013008 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013008
	.thumb_func
sub_8013008:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0xfa
	lsls r0, r0, #0x18
	adds r1, r4, r0
	ldr r0, _08013040 @ =0x00017FFF
	movs r5, #1
	cmp r1, r0
	bhi _0801301E
	movs r5, #0
_0801301E:
	ldr r2, _08013044 @ =0x085C2438
	ldrb r1, [r3]
	movs r0, #0xf0
	ands r0, r1
	lsrs r0, r0, #3
	adds r0, r5, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_80D65C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013040: .4byte 0x00017FFF
_08013044: .4byte 0x085C2438

