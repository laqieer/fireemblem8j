	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8063158, "ax", %progbits
@ sub_8063158 @ JP 0x08063158 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063158
	.thumb_func
sub_8063158:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08063184 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063188 @ =0x08600CE0
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0806318C @ =0x080E2C0E
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _08063194
	ldr r0, _08063190 @ =0x0869CCAC
	b _08063196
	.align 2, 0
_08063184: .4byte 0x0201774C
_08063188: .4byte 0x08600CE0
_0806318C: .4byte 0x080E2C0E
_08063190: .4byte 0x0869CCAC
_08063194:
	ldr r0, _080631A0 @ =0x086A56F8
_08063196:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080631A0: .4byte 0x086A56F8

