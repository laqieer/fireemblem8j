	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.section .text.sub_80346B0, "ax", %progbits
@ sub_80346B0 @ JP 0x080346B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80346B0
	.thumb_func
sub_80346B0:
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080346D8 @ =0x085C661C
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #6
	bl InitTextDb
	bl sub_80034D0
	movs r0, #4
	bl sub_8003508
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080346D8: .4byte 0x085C661C

