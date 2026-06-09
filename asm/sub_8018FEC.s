	.syntax unified
	.section .text.sub_8018FEC, "ax", %progbits
@ sub_8018FEC @ JP 0x08018FEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018FEC
	.thumb_func
sub_8018FEC:
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08019000
	movs r1, #0xfe
	lsls r1, r1, #7
	adds r0, r0, r1
	b _08019014
_08019000:
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08019010
	ldr r2, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0
	cmp r0, #0
	beq _08019012
_08019010:
	adds r1, r0, #0
_08019012:
	adds r0, r1, #0
_08019014:
	pop {r1}
	bx r1

