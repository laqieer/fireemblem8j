	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_80752F8, "ax", %progbits
@ sub_80752F8 @ JP 0x080752F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80752F8
	.thumb_func
sub_80752F8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08075328 @ =0x087A951C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0807532C @ =0x080E6868
	str r1, [r0, #0x48]
	ldr r1, _08075330 @ =0x087A9534
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08075334 @ =0x087A95C8
	str r1, [r0, #0x54]
	ldr r1, _08075338 @ =0x087A965C
	str r1, [r0, #0x58]
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075328: .4byte 0x087A951C
_0807532C: .4byte 0x080E6868
_08075330: .4byte 0x087A9534
_08075334: .4byte 0x087A95C8
_08075338: .4byte 0x087A965C

