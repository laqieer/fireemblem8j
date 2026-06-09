	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807C37C, 0x0807C37C + 1
	.set sub_807C394, 0x0807C394 + 1
	.section .text.sub_8010088, "ax", %progbits
@ sub_8010088 @ JP 0x08010088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010088
	.thumb_func
sub_8010088:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801009A
	bl sub_807C394
_0801009A:
	bl sub_807C37C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080100C4
	bl RefreshEntityBmMaps
	bl sub_8027144
	bl sub_8019914
	ldr r0, _080100C0 @ =0x0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	movs r0, #2
	b _080100C6
	.align 2, 0
_080100C0: .4byte 0x0202E4EC
_080100C4:
	movs r0, #3
_080100C6:
	pop {r1}
	bx r1
	.align 2, 0

