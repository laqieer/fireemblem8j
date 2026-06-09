	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8061890, "ax", %progbits
@ sub_8061890 @ JP 0x08061890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061890
	.thumb_func
sub_8061890:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080618C8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080618CC @ =0x0860088C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x2c
	strh r1, [r0, #0x30]
	ldr r0, _080618D0 @ =0x08659FFC
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _080618D4 @ =0x08659404
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080618C8: .4byte 0x0201774C
_080618CC: .4byte 0x0860088C
_080618D0: .4byte 0x08659FFC
_080618D4: .4byte 0x08659404

