	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_800D45C, 0x0800D45C + 1
	.section .text.sub_8022E2C, "ax", %progbits
@ sub_8022E2C @ JP 0x08022E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022E2C
	.thumb_func
sub_8022E2C:
	push {lr}
	bl sub_800D45C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08022E4C
	ldr r0, _08022E48 @ =0x085C3B10
	movs r1, #3
	bl sub_8002BCC
	movs r0, #0xb
	b _08022E4E
	.align 2, 0
_08022E48: .4byte 0x085C3B10
_08022E4C:
	movs r0, #0
_08022E4E:
	pop {r1}
	bx r1
	.align 2, 0

