	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806BDE8, "ax", %progbits
@ sub_806BDE8 @ JP 0x0806BDE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806BDE8
	.thumb_func
sub_806BDE8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806BE14 @ =0x08602D6C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	ldr r0, _0806BE18 @ =0x086CF1EC
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806BE1C @ =0x086CEDCC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BE14: .4byte 0x08602D6C
_0806BE18: .4byte 0x086CF1EC
_0806BE1C: .4byte 0x086CEDCC

