	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_800D4CC, "ax", %progbits
@ sub_800D4CC @ JP 0x0800D4CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D4CC
	.thumb_func
sub_800D4CC:
	push {lr}
	ldr r0, _0800D4F4 @ =0x085B98A0
	bl Proc_Find
	cmp r0, #0
	bne _0800D4E2
	ldr r0, _0800D4F8 @ =0x085B98D8
	bl Proc_Find
	cmp r0, #0
	beq _0800D51C
_0800D4E2:
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800D51C
	lsls r0, r0, #2
	ldr r1, _0800D4FC @ =_0800D500
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D4F4: .4byte 0x085B98A0
_0800D4F8: .4byte 0x085B98D8
_0800D4FC: .4byte _0800D500
_0800D500: @ jump table
	.4byte _0800D51C @ case 0
	.4byte _0800D518 @ case 1
	.4byte _0800D518 @ case 2
	.4byte _0800D51C @ case 3
	.4byte _0800D51C @ case 4
	.4byte _0800D51C @ case 5
_0800D518:
	movs r0, #1
	b _0800D51E
_0800D51C:
	movs r0, #0
_0800D51E:
	pop {r1}
	bx r1
	.align 2, 0

