	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B7C4C, "ax", %progbits
@ sub_80B7C4C @ JP 0x080B7C4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7C4C
	.thumb_func
sub_80B7C4C:
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B7C68 @ =0x08AAFD24
	adds r1, r2, #0
	bl sub_8002BCC
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B7C68: .4byte 0x08AAFD24

