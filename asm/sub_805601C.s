	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_8077F0C, 0x08077F0C + 1
	.section .text.sub_805601C, "ax", %progbits
@ sub_805601C @ JP 0x0805601C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805601C
	.thumb_func
sub_805601C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805603C @ =0x0203E0FA
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08056044
	ldr r0, _08056040 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80195E4
	bl sub_8019914
	b _0805604E
	.align 2, 0
_0805603C: .4byte 0x0203E0FA
_08056040: .4byte 0x0202BCEC
_08056044:
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, #1
	bl sub_8077F0C
_0805604E:
	ldr r0, _08056074 @ =0x020228A8
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl sub_80737A4
	bl sub_8001EE4
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056074: .4byte 0x020228A8

