	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_80752B4, "ax", %progbits
@ sub_80752B4 @ JP 0x080752B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80752B4
	.thumb_func
sub_80752B4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080752E4 @ =0x087A951C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080752E8 @ =0x080E681A
	str r1, [r0, #0x48]
	ldr r1, _080752EC @ =0x087A9534
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080752F0 @ =0x087A95C8
	str r1, [r0, #0x54]
	ldr r1, _080752F4 @ =0x087A965C
	str r1, [r0, #0x58]
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080752E4: .4byte 0x087A951C
_080752E8: .4byte 0x080E681A
_080752EC: .4byte 0x087A9534
_080752F0: .4byte 0x087A95C8
_080752F4: .4byte 0x087A965C

