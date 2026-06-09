	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80C11E8, 0x080C11E8 + 1
	.section .text.sub_80BFA40, "ax", %progbits
@ sub_80BFA40 @ JP 0x080BFA40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFA40
	.thumb_func
sub_80BFA40:
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080BFA64 @ =0x08AC1844
	bl sub_8002BCC
	adds r4, r0, #0
	ldr r1, _080BFA68 @ =0x03005314
	movs r2, #0xa0
	lsls r2, r2, #7
	movs r3, #0xe
	bl sub_80C11E8
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BFA64: .4byte 0x08AC1844
_080BFA68: .4byte 0x03005314

