	.syntax unified
	.section .text.sub_807B620, "ax", %progbits
@ sub_807B620 @ JP 0x0807B620 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B620
	.thumb_func
sub_807B620:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r3, #0
	ldr r4, _0807B644 @ =0x08A132F8
	ldr r1, _0807B648 @ =0x030018F8
	adds r2, r1, #0
_0807B62E:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807B64C
	adds r0, r3, #1
	strb r0, [r2]
	ldrh r0, [r4]
	adds r0, r0, r5
	strh r0, [r2, #2]
	strb r3, [r6]
	adds r0, r1, #0
	b _0807B65A
	.align 2, 0
_0807B644: .4byte 0x08A132F8
_0807B648: .4byte 0x030018F8
_0807B64C:
	adds r4, #2
	adds r2, #0x4c
	adds r1, #0x4c
	adds r3, #1
	cmp r3, #3
	ble _0807B62E
	movs r0, #0
_0807B65A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

