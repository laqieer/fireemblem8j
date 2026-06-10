	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_800D404, "ax", %progbits
@ sub_800D404 @ JP 0x0800D404 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D404
	.thumb_func
sub_800D404:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800D458 @ =0x085B98D8
	movs r1, #3
	bl sub_8002BCC
	mov ip, r0
	movs r2, #0
	str r2, [r0, #0x2c]
	str r4, [r0, #0x30]
	str r4, [r0, #0x34]
	str r4, [r0, #0x38]
	movs r3, #0
	strh r2, [r0, #0x3c]
	strh r2, [r0, #0x3e]
	mov r1, ip
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x42
	strb r3, [r0]
	adds r0, #2
	strh r2, [r0]
	mov r0, ip
	str r2, [r0, #0x48]
	adds r0, #0x4c
	strh r2, [r0]
	adds r0, #2
	strb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #0x3c]
	movs r1, #1
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D458: .4byte 0x085B98D8

