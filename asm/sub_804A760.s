	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_804A760, "ax", %progbits
@ sub_804A760 @ JP 0x0804A760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A760
	.thumb_func
sub_804A760:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804A774 @ =0x0203DA20
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804A778
	cmp r0, #2
	beq _0804A78C
	b _0804A7BC
	.align 2, 0
_0804A774: .4byte 0x0203DA20
_0804A778:
	ldr r0, _0804A784 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq _0804A79E
	ldr r0, _0804A788 @ =0x085D4660
	b _0804A7A0
	.align 2, 0
_0804A784: .4byte 0x0202BCEC
_0804A788: .4byte 0x085D4660
_0804A78C:
	ldr r0, _0804A7A8 @ =0x0202BCEC
	ldrb r1, [r0, #0xf]
	ldr r0, _0804A7AC @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0804A7B4
_0804A79E:
	ldr r0, _0804A7B0 @ =0x085D43A0
_0804A7A0:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _0804A7BC
	.align 2, 0
_0804A7A8: .4byte 0x0202BCEC
_0804A7AC: .4byte 0x085D31E8
_0804A7B0: .4byte 0x085D43A0
_0804A7B4:
	ldr r0, _0804A7C8 @ =0x085D4570
	adds r1, r4, #0
	bl Proc_StartBlocking
_0804A7BC:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A7C8: .4byte 0x085D4570

